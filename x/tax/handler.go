package tax

import (
	"fmt"

	sdk "github.com/cosmos/cosmos-sdk/types"
	sdkerrors "github.com/cosmos/cosmos-sdk/types/errors"
	"gitlab-nomo.credissimo.net/nomo/cosmzone/x/tax/keeper"
	"gitlab-nomo.credissimo.net/nomo/cosmzone/x/tax/types"
)

// NewHandler ...
func NewHandler(k keeper.Keeper) sdk.Handler {
	return func(ctx sdk.Context, msg sdk.Msg) (*sdk.Result, error) {
		//ctx = ctx.WithEventManager(sdk.NewEventManager())

		switch msg := msg.(type) {

		default:
			errMsg := fmt.Sprintf("unrecognized %s message type: %T", types.ModuleName, msg)
			return nil, sdkerrors.Wrap(sdkerrors.ErrUnknownRequest, errMsg)
		}
	}
}
